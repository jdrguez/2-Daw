import { mount } from '@vue/test-utils';
import WelcomeItem from '../WelcomeItem.vue';
import { describe, it, expect } from "vitest";

describe('WelcomeItem.vue', () => {
  it('renders correctly with default slots', () => {
    const wrapper = mount(WelcomeItem, {
      slots: {
        icon: '<span class="test-icon">Icon</span>',
        heading: 'Test Heading',
      },
    });
    expect(wrapper.find('.item').exists()).toBe(true);
    expect(wrapper.find('.test-icon').exists()).toBe(true);
    expect(wrapper.find('h3').text()).toBe('Test Heading');
  });

  it('applies correct styles', () => {
    const wrapper = mount(WelcomeItem);
    expect(wrapper.classes()).toContain('item');
    expect(wrapper.element).toMatchSnapshot();
  });

  it('displays content passed to the default slot', () => {
    const wrapper = mount(WelcomeItem, {
      slots: {
        default: '<p>Default Slot Content</p>',
      },
    });
    expect(wrapper.html()).toContain('Default Slot Content');
  });

});
