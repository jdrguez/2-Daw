import { mount } from '@vue/test-utils';
import HelloWorld from '../HelloWorld.vue';
import { describe, it, expect } from "vitest";

describe('HelloWorld.vue', () => {
  it('renders correctly with the required prop', () => {
    const wrapper = mount(HelloWorld, {
      props: {
        msg: 'Hello, World!',
      },
    });
    expect(wrapper.find('.greetings').exists()).toBe(true);
    expect(wrapper.find('h1.green').text()).toBe('Hello, World!');
  });

  it('displays the correct static content', () => {
    const wrapper = mount(HelloWorld, {
      props: {
        msg: 'Hello, World!',
      },
    });
    expect(wrapper.html()).toContain("You’ve successfully created a project with");
    expect(wrapper.html()).toContain("Vite");
    expect(wrapper.html()).toContain("Vue 3");
  });

  it('applies correct styles', () => {
    const wrapper = mount(HelloWorld, {
      props: {
        msg: 'Hello, World!',
      },
    });
    expect(wrapper.find('h1').classes()).toContain('green');
    expect(wrapper.element).toMatchSnapshot();
  });
});
